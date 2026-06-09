	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80B1794, "ax", %progbits
@ sub_80B1794 @ JP 0x080B1794 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1794
	.thumb_func
sub_80B1794:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r7, r2, #0
	ldr r0, _080B17EC @ =0x08A9DAFC
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	beq _080B17E4
	ldr r0, _080B17F0 @ =0x08A99FA8
	adds r1, r7, #0
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_8000D68
	cmp r6, #0
	bne _080B17C4
	ldr r0, _080B17F4 @ =0x08A99270
	ldr r2, _080B17F8 @ =0x06010000
	adds r1, r4, r2
	bl sub_8013008
_080B17C4:
	cmp r6, #1
	bne _080B17D2
	ldr r0, _080B17FC @ =0x08A9919C
	ldr r2, _080B17F8 @ =0x06010000
	adds r1, r4, r2
	bl sub_8013008
_080B17D2:
	asrs r1, r4, #5
	movs r2, #0xf
	ands r2, r7
	lsls r2, r2, #0xc
	adds r1, r1, r2
	adds r2, r5, #0
	adds r2, #0x54
	strh r1, [r2]
	str r6, [r5, #0x2c]
_080B17E4:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B17EC: .4byte 0x08A9DAFC
_080B17F0: .4byte 0x08A99FA8
_080B17F4: .4byte 0x08A99270
_080B17F8: .4byte 0x06010000
_080B17FC: .4byte 0x08A9919C

