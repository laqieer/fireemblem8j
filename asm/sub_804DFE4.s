	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set __divsi3, 0x080D65F8 + 1
	.section .text.sub_804DFE4, "ax", %progbits
@ sub_804DFE4 @ JP 0x0804DFE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804DFE4
	.thumb_func
sub_804DFE4:
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x10
	asrs r7, r1, #0x10
	ldr r0, _0804E034 @ =0x085D4BEC
	bl Proc_Find
	adds r6, r0, #0
	cmp r6, #0
	beq _0804E02C
	adds r5, r6, #0
	adds r5, #0x3c
	strb r4, [r5]
	movs r0, #0xff
	ands r0, r7
	strh r0, [r6, #0x3e]
	adds r0, r6, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	ldr r4, [r6, #0x34]
	muls r0, r4, r0
	lsls r0, r0, #3
	ldrb r1, [r5]
	bl __divsi3
	str r0, [r6, #0x38]
	lsls r4, r4, #0xb
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r0, r4, #0
	bl __divsi3
	adds r1, r6, #0
	adds r1, #0x42
	strh r0, [r1]
_0804E02C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E034: .4byte 0x085D4BEC

