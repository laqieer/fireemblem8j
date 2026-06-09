	.syntax unified
	.section .text.SetSramFastFunc, "ax", %progbits
@ SetSramFastFunc @ JP 0x080D64AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetSramFastFunc
	.thumb_func
SetSramFastFunc:
	push {lr}
	ldr r2, _080D64C0 @ =sub_80D63E0
	movs r0, #1
	bics r2, r0
	ldr r3, _080D64C4 @ =0x03002AB0
	ldr r0, _080D64C8 @ =sub_80D6420
	ldr r1, _080D64C0 @ =sub_80D63E0
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _080D64D8
	.align 2, 0
_080D64C0: .4byte 0x080D63E1  @ sub_80D63E0
_080D64C4: .4byte 0x03002AB0
_080D64C8: .4byte 0x080D6421  @ sub_80D6420
_080D64CC:
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, #2
	adds r3, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_080D64D8:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _080D64CC
	ldr r1, _080D64F8 @ =0x03006790
	ldr r0, _080D64FC @ =0x03002AB1
	str r0, [r1]
	ldr r2, _080D6500 @ =VerifySramFast_Core
	movs r0, #1
	bics r2, r0
	ldr r3, _080D6504 @ =0x03002A10
	ldr r0, _080D6508 @ =SetSramFastFunc
	ldr r1, _080D6500 @ =VerifySramFast_Core
	subs r0, r0, r1
	lsls r0, r0, #0xf
	b _080D6518
	.align 2, 0
_080D64F8: .4byte 0x03006790
_080D64FC: .4byte 0x03002AB1
_080D6500: .4byte 0x080D6461  @ VerifySramFast_Core
_080D6504: .4byte 0x03002A10
_080D6508: .4byte SetSramFastFunc
_080D650C:
	ldrh r0, [r2]
	strh r0, [r3]
	adds r2, #2
	adds r3, #2
	subs r0, r1, #1
	lsls r0, r0, #0x10
_080D6518:
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _080D650C
	ldr r1, _080D6538 @ =0x03006794
	ldr r0, _080D653C @ =0x03002A11
	str r0, [r1]
	ldr r2, _080D6540 @ =0x04000204
	ldrh r0, [r2]
	ldr r1, _080D6544 @ =0x0000FFFC
	ands r0, r1
	movs r1, #3
	orrs r0, r1
	strh r0, [r2]
	pop {r0}
	bx r0
	.align 2, 0
_080D6538: .4byte 0x03006794
_080D653C: .4byte 0x03002A11
_080D6540: .4byte 0x04000204
_080D6544: .4byte 0x0000FFFC

