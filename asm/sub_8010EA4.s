	.syntax unified
	.set sub_800BF3C, 0x0800BF3C + 1
	.set sub_8083360, 0x08083360 + 1
	.set sub_80833A8, 0x080833A8 + 1
	.set sub_8083510, 0x08083510 + 1
	.section .text.sub_8010EA4, "ax", %progbits
@ sub_8010EA4 @ JP 0x08010EA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8010EA4
	.thumb_func
sub_8010EA4:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, [r5, #0x38]
	ldrb r0, [r1]
	movs r4, #0xf
	ands r4, r0
	movs r2, #2
	ldrsh r0, [r1, r2]
	bl sub_800BF3C
	adds r2, r0, #0
	cmp r2, #0
	bne _08010EC2
	movs r0, #6
	b _08010F00
_08010EC2:
	cmp r4, #0
	beq _08010ECC
	cmp r4, #0xf
	beq _08010EE2
	b _08010EFE
_08010ECC:
	ldrh r0, [r5, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08010EFE
	adds r0, r5, #0
	adds r1, r2, #0
	bl sub_8083360
	b _08010EFE
_08010EE2:
	ldrh r0, [r5, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08010EFA
	adds r0, r5, #0
	movs r1, #0x78
	bl sub_8083510
	movs r0, #2
	b _08010F00
_08010EFA:
	bl sub_80833A8
_08010EFE:
	movs r0, #0
_08010F00:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

