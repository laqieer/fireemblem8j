	.syntax unified
	.set sub_80012FC, 0x080012FC + 1
	.section .text.sub_800139C, "ax", %progbits
@ sub_800139C @ JP 0x0800139C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800139C
	.thumb_func
sub_800139C:
	push {lr}
	adds r2, r0, #0
	ldr r0, _080013C8 @ =0x04000130
	ldrh r0, [r0]
	mvns r0, r0
	lsls r0, r0, #0x16
	lsrs r1, r0, #0x16
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0xf
	beq _080013B8
	ldr r0, _080013CC @ =0x0300000E
	ldrh r0, [r0]
	bics r1, r0
_080013B8:
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	adds r0, r2, #0
	bl sub_80012FC
	pop {r0}
	bx r0
	.align 2, 0
_080013C8: .4byte 0x04000130
_080013CC: .4byte 0x0300000E

