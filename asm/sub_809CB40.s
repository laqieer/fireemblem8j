	.syntax unified
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_8003508, 0x08003508 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_80973C8, 0x080973C8 + 1
	.set sub_8097D24, 0x08097D24 + 1
	.section .text.sub_809CB40, "ax", %progbits
@ sub_809CB40 @ JP 0x0809CB40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809CB40
	.thumb_func
sub_809CB40:
	push {r4, lr}
	bl sub_80034C4
	bl sub_804F8F4
	bl sub_801569C
	movs r0, #4
	bl sub_8003508
	movs r4, #0xc0
	lsls r4, r4, #7
	adds r0, r4, #0
	movs r1, #8
	bl sub_8097D24
	adds r0, r4, #0
	movs r1, #0xf
	bl sub_80973C8
	ldr r0, _0809CBA4 @ =0x08A981C8
	ldr r1, _0809CBA8 @ =0x06000440
	bl sub_8013008
	ldr r0, _0809CBAC @ =0x08A98260
	ldr r4, _0809CBB0 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _0809CBB4 @ =0x020234A8
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl j_TmApplyTsa
	ldr r0, _0809CBB8 @ =0x08A99FE8
	ldr r1, _0809CBBC @ =0x06010800
	bl sub_8013008
	ldr r0, _0809CBC0 @ =0x08A99FA8
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	bl sub_8001EE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809CBA4: .4byte 0x08A981C8
_0809CBA8: .4byte 0x06000440
_0809CBAC: .4byte 0x08A98260
_0809CBB0: .4byte 0x02020188
_0809CBB4: .4byte 0x020234A8
_0809CBB8: .4byte 0x08A99FE8
_0809CBBC: .4byte 0x06010800
_0809CBC0: .4byte 0x08A99FA8

