class Client < ActiveRecord::Base
validates :nombre, :direccion, presence: {message: "Es necesario llenar este campo"}
	validates :telefono, presence: {message: "Es necesario llenar este campo"}
	validates :telefono, numericality: {only_integer: true, message: "debe ser numerico"}
    validates :e_mail, uniqueness: {case_sensitive: false ,message: "ya esta registrado"}
   
end
