	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set SetMainUpdateRoutine, 0x080012D8 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_80011F0, 0x080011F0 + 1
	.set sub_8001208, 0x08001208 + 1
	.set sub_8015710, 0x08015710 + 1
	.set sub_80265CC, 0x080265CC + 1
	.set sub_804F610, 0x0804F610 + 1
	.section .text.sub_8031044, "ax", %progbits
@ sub_8031044 @ JP 0x08031044 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8031044
	.thumb_func
sub_8031044:
	push {lr}
	ldr r0, _08031090 @ =sub_8015318
	bl SetMainUpdateRoutine
	ldr r0, _08031094 @ =sub_80152C8
	bl sub_8001208
	bl sub_8015710
	bl sub_80265CC
	bl sub_804F610
	ldr r2, _08031098 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	bl SetDefaultColorEffects
	movs r0, #0
	bl sub_80011F0
	ldr r0, _0803109C @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_08031090: .4byte 0x08015319  @ sub_8015318
_08031094: .4byte 0x080152C9  @ sub_80152C8
_08031098: .4byte 0x03003020
_0803109C: .4byte 0x02023CA8

