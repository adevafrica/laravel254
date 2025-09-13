<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Unit extends Model
{
    protected $fillable =[

        "unit_code", "unit_name", "base_unit", "operator", "operation_value", "is_active", "pos_accnt_id"
    ];

    public function product()
    {
    	return $this->hasMany('App\Models\Product');
    }
}
