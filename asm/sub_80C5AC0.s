	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set StartMuralBackground, 0x08088E74 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8015710, 0x08015710 + 1
	.set sub_80265CC, 0x080265CC + 1
	.section .text.sub_80C5AC0, "ax", %progbits
@ sub_80C5AC0 @ JP 0x080C5AC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C5AC0
	.thumb_func
sub_80C5AC0:
	push {r4, r5, r6, r7, lr}
	ldr r0, _080C5B7C @ =0x08AC2248
	bl sub_8001ACC
	ldr r7, _080C5B80 @ =0x02022CA8
	adds r0, r7, #0
	movs r1, #0
	bl sub_80011D0
	ldr r5, _080C5B84 @ =0x020234A8
	adds r0, r5, #0
	movs r1, #0
	bl sub_80011D0
	ldr r6, _080C5B88 @ =0x02023CA8
	adds r0, r6, #0
	movs r1, #0
	bl sub_80011D0
	movs r0, #7
	bl BG_EnableSyncByMask
	bl sub_8015710
	bl sub_80265CC
	ldr r1, _080C5B8C @ =0x0600B000
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #0
	bl StartMuralBackground
	ldr r0, _080C5B90 @ =0x08B1DF18
	ldr r1, _080C5B94 @ =0x06003000
	bl sub_8013008
	ldr r0, _080C5B98 @ =0x08B1E65C
	movs r1, #0xc0
	movs r2, #0x60
	bl sub_8000D68
	bl sub_8001EE4
	ldr r0, _080C5B9C @ =0x08B1E49C
	ldr r4, _080C5BA0 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r5, #0
	adds r1, r4, #0
	bl j_TmApplyTsa
	movs r0, #0xe1
	lsls r0, r0, #2
	adds r5, r5, r0
	ldr r1, _080C5BA4 @ =0x08B1E5A0
	movs r4, #0xc3
	lsls r4, r4, #7
	adds r0, r5, #0
	adds r2, r4, #0
	bl j_TmApplyTsa
	adds r0, r7, #0
	adds r0, #0xc8
	ldr r1, _080C5BA8 @ =0x08B1E5FC
	adds r2, r4, #0
	bl j_TmApplyTsa
	movs r1, #0x91
	lsls r1, r1, #2
	adds r0, r7, r1
	ldr r1, _080C5BAC @ =0x08B1E61C
	adds r2, r4, #0
	bl j_TmApplyTsa
	movs r1, #0xb1
	lsls r1, r1, #2
	adds r0, r7, r1
	ldr r1, _080C5BB0 @ =0x08B1E634
	adds r2, r4, #0
	bl j_TmApplyTsa
	ldr r0, _080C5BB4 @ =0x00000432
	adds r6, r6, r0
	ldr r1, _080C5BB8 @ =0x08B1E648
	adds r0, r6, #0
	adds r2, r4, #0
	bl j_TmApplyTsa
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C5B7C: .4byte 0x08AC2248
_080C5B80: .4byte 0x02022CA8
_080C5B84: .4byte 0x020234A8
_080C5B88: .4byte 0x02023CA8
_080C5B8C: .4byte 0x0600B000
_080C5B90: .4byte 0x08B1DF18
_080C5B94: .4byte 0x06003000
_080C5B98: .4byte 0x08B1E65C
_080C5B9C: .4byte 0x08B1E49C
_080C5BA0: .4byte 0x02020188
_080C5BA4: .4byte 0x08B1E5A0
_080C5BA8: .4byte 0x08B1E5FC
_080C5BAC: .4byte 0x08B1E61C
_080C5BB0: .4byte 0x08B1E634
_080C5BB4: .4byte 0x00000432
_080C5BB8: .4byte 0x08B1E648

