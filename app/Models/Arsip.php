<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Arsip extends Model
{
    use HasFactory;

    protected $fillable = [
        'id',
        'id_arsips',
        'tipe',
        'name_display',
        'name_origin',
        'extension',
        'created_at',
        'updated_at'
    ];
}
