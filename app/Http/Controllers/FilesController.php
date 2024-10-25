<?php

namespace App\Http\Controllers;

use App\Models\Arsip;
use Illuminate\Http\Request;
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


    public function delete($id)
    {
        try {
            DB::table('arsips')
                ->where('id', $id)
                ->limit(1)
                ->delete();

            return response()->json([
                'success'   => true,
                'message'   => 'success',
                'data'      => [],
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
}
