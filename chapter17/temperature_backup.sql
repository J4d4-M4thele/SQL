PGDMP                  	    {            analysis    16.0    16.0                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    17481    analysis    DATABASE     �   CREATE DATABASE analysis WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_South Africa.1252';
    DROP DATABASE analysis;
                postgres    false            �            1259    21958    temperature_test    TABLE     �   CREATE TABLE public.temperature_test (
    station_name character varying(50) NOT NULL,
    observation_date date NOT NULL,
    max_temp integer,
    min_temp integer,
    max_temp_group character varying(40)
);
 $   DROP TABLE public.temperature_test;
       public         heap    postgres    false                      0    21958    temperature_test 
   TABLE DATA           n   COPY public.temperature_test (station_name, observation_date, max_temp, min_temp, max_temp_group) FROM stdin;
    public          postgres    false    239   �       �           2606    21962 &   temperature_test temperature_test_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.temperature_test
    ADD CONSTRAINT temperature_test_pkey PRIMARY KEY (station_name, observation_date);
 P   ALTER TABLE ONLY public.temperature_test DROP CONSTRAINT temperature_test_pkey;
       public            postgres    false    239    239            �           2620    21965 #   temperature_test temperature_insert    TRIGGER     �   CREATE TRIGGER temperature_insert BEFORE INSERT ON public.temperature_test FOR EACH ROW EXECUTE FUNCTION public.classify_max_temp();
 <   DROP TRIGGER temperature_insert ON public.temperature_test;
       public          postgres    false    239               o   x�m�1�0���\��㴥� ��Bbe������Yzz8@����zzx��TBb	��#n�~��
͍Y:�/{)�fK�,�q@���J�d��XRĹǵ:=;"�>�+d     