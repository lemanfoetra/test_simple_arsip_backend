<?php

namespace App\Http\Controllers;

use App\Models\Arsip;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class ArsipController extends Controller
{

    public function index($parrent)
    {
        try {
            $folders = $this->listAllFolder($parrent);

            return response()->json([
                'success'   => true,
                'message'   => 'success',
                'data'      => $folders,
            ], 200);
        } catch (\Throwable $th) {
            return response()->json([
                'success'   => false,
                'message'   => $th->getMessage(),
                'data'      => [],
            ], 500);
        }
    }


    public function store(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'id_arsips' => 'required',
                'name'      => 'required|string|max:100||unique:arsips,name_display',
            ]);

            if ($validator->fails()) {
                return response()->json([
                    'success'       => false,
                    'message'       => $validator->errors(),
                    'message_type'  => 'array',
                    'data'          => [],
                ], 422);
            }

            // CREATE FOLDER FILES
            $folder_name = Str::slug(strtolower($request->name));

            $folder = Arsip::create([
                'tipe'          => '1',
                'id_arsips'     => $request->id_arsips,
                'name_display'  => $request->name,
                'name_origin'   => $folder_name,
            ]);

            return response()->json([
                'success'   => true,
                'message'   => 'success',
                'data'      => $folder,
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


    private function listAllFolder($parrent, $data = [])
    {
        $results = DB::table('arsips')
            ->where('id_arsips', $parrent)
            ->where('tipe', '1')
            ->get();

        foreach ($results as $result) {
            if ($this->haveChild($result->id)) {
                $data = array_merge($data, [[
                    'id'            => $result->id,
                    'id_arsips'     => $result->id_arsips,
                    'level'         => $this->levelFolder($result->id),
                    'tipe'          => $result->tipe,
                    'name_display'  => $result->name_display,
                    'parrent'       => $parrent,
                ]]);
                $data = $this->listAllFolder($result->id, $data);
            } else {
                $data = array_merge($data, [[
                    'id'            => $result->id,
                    'id_arsips'     => $result->id_arsips,
                    'level'         => $this->levelFolder($result->id),
                    'tipe'          => $result->tipe,
                    'name_display'  => $result->name_display,
                    'parrent'       => $parrent,
                ]]);
            }
        }
        return $data;
    }


    private function haveChild($parrent)
    {
        $result = DB::table('arsips')
            ->select(['id'])
            ->where('tipe', '1')
            ->where('id_arsips', $parrent)
            ->first();
        if (!empty($result)) {
            return true;
        }
        return false;
    }


    private function levelFolder($id, $level = 1)
    {
        $result = DB::table('arsips')
            ->select(['id', 'id_arsips'])
            ->where('id', $id)
            ->first();
        if ((string)$result->id_arsips !== '0') {
            $level++;
            return $this->levelFolder($result->id_arsips, $level);
        } else {
            return $level;
        }
    }
}
