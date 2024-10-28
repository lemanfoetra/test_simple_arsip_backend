<?php

namespace App\Http\Controllers;

use App\Models\Arsip;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class FilesController extends Controller
{

    public function index($parrent)
    {
        try {
            $files = DB::table('arsips')
                ->where('id_arsips', $parrent)
                ->orderBy('tipe', 'ASC')
                ->get();
            foreach ($files as $key => $value) {
                $files[$key]->url = $value->name_origin;
                if ($value->tipe == '2') {
                    $files[$key]->url = url('arsip/download/' . Crypt::encrypt($value->id));
                }
            }

            return response()->json([
                'success'   => true,
                'message'   => 'success',
                'data'      => $files,
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'success'   => false,
                'message'   => $th->getMessage(),
                'data'      => [],
            ], 500);
        }
    }


    public function store($parrent, Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'file_arsip' => 'required|mimes:pdf|max:' . (1024 * 5),
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success'       => false,
                    'message'       => $validator->errors(),
                    'message_type'  => 'array',
                    'data'          => [],
                ], 422);
            }

            $dataInput = [
                'tipe'          => '2',
                'id_arsips'     => $parrent,
                'name_display'  => $request->file('file_arsip')->getClientOriginalName(),
            ];
            if ($request->file('file_arsip') != null) {
                $dataInput['name_origin'] = Storage::putFile('public/arsip', $request->file('file_arsip'));
            }
            $file = Arsip::create($dataInput);

            return response()->json([
                'success'   => true,
                'message'   => 'success',
                'data'      => $file,
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'success'       => false,
                'message'       => $th->getMessage(),
                'message_type'  => 'string',
                'data'          => [],
            ], 200);
        }
    }



    public function update($id, Request $request)
    {
        try {
            $validation = [
                'name'      => "required|string|max:255|unique:arsips,name_display,{$id}",
            ];
            $validator = Validator::make($request->all(), $validation);

            if ($validator->fails()) {
                return response()->json([
                    'success'       => false,
                    'message'       => $validator->errors(),
                    'message_type'  => 'array',
                    'data'          => [],
                ], 422);
            }

            // RENAME FOLDER
            $folder_name = Str::slug(strtolower($request->name));

            $data = [
                'tipe'          => '1',
                'name_display'  => $request->name,
                'name_origin'   => $folder_name,
            ];

            DB::table('arsips')
                ->where('id', $id)
                ->update($data);

            return response()->json([
                'success'   => true,
                'message'   => 'success',
                'data'      => $data,
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'success'       => false,
                'message'       => $th->getMessage(),
                'message_type'  => 'string',
                'data'          => [],
            ], 500);
        }
    }


    public function delete($parrent, $id)
    {
        try {
            $old =  DB::table('arsips')
                ->where('id', $id)
                ->first();

            if (!empty($old) && $old->tipe == '2') {
                if (Storage::exists($old->name_origin)) {
                    Storage::delete($old->name_origin);
                }
            }

            DB::table('arsips')
                ->where('id', $id)
                ->limit(1)
                ->delete();

            return response()->json([
                'success'   => true,
                'message'   => 'success',
                'data'      => [$old],
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'success'       => false,
                'message'       => $th->getMessage(),
                'message_type'  => 'string',
                'data'          => [],
            ], 500);
        }
    }


    public function download($enc_id)
    {
        $id = Crypt::decrypt($enc_id);
        $arsip = DB::table('arsips')
            ->where('id', $id)
            ->first();

        return response()->file('../storage/app/' . $arsip->name_origin);
        // return Storage::download($materi->path_materi);
    }
}
