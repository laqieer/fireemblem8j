	.syntax unified
	.set sub_8013DC0, 0x08013DC0 + 1
	.set sub_8013DD8, 0x08013DD8 + 1
	.set sub_8013DF0, 0x08013DF0 + 1
	.set sub_8013E08, 0x08013E08 + 1
	.section .text.sub_800E160, "ax", %progbits
@ sub_800E160 @ JP 0x0800E160 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800E160
	.thumb_func
sub_800E160:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800E174
	movs r0, #0
	b _0800E1F4
_0800E174:
	ldr r1, [r4, #0x38]
	ldrb r0, [r1]
	movs r2, #0xf
	ands r2, r0
	ldrh r0, [r1, #2]
	cmp r2, #1
	beq _0800E19E
	cmp r2, #1
	bgt _0800E18C
	cmp r2, #0
	beq _0800E196
	b _0800E1F2
_0800E18C:
	cmp r2, #2
	beq _0800E1A6
	cmp r2, #3
	beq _0800E1DC
	b _0800E1F2
_0800E196:
	adds r1, r4, #0
	bl sub_8013DD8
	b _0800E1AC
_0800E19E:
	adds r1, r4, #0
	bl sub_8013DC0
	b _0800E1E2
_0800E1A6:
	adds r1, r4, #0
	bl sub_8013E08
_0800E1AC:
	ldrh r1, [r4, #0x3c]
	ldr r0, _0800E1D4 @ =0x0000FEFF
	ands r0, r1
	strh r0, [r4, #0x3c]
	ldr r2, _0800E1D8 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #2
	b _0800E1F4
	.align 2, 0
_0800E1D4: .4byte 0x0000FEFF
_0800E1D8: .4byte 0x03003020
_0800E1DC:
	adds r1, r4, #0
	bl sub_8013DF0
_0800E1E2:
	ldrh r1, [r4, #0x3c]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #2
	b _0800E1F4
_0800E1F2:
	movs r0, #6
_0800E1F4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

