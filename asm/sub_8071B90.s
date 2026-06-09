	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80718B4, 0x080718B4 + 1
	.set sub_807193C, 0x0807193C + 1
	.set sub_8071A00, 0x08071A00 + 1
	.set sub_8071A2C, 0x08071A2C + 1
	.section .text.sub_8071B90, "ax", %progbits
@ sub_8071B90 @ JP 0x08071B90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071B90
	.thumb_func
sub_8071B90:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08071BAA
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_80718B4
_08071BAA:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x10
	bne _08071BBA
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_8071A00
_08071BBA:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x4b
	bne _08071BCC
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_8071A2C
	str r0, [r4, #0x64]
_08071BCC:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x5e
	bne _08071BDC
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_807193C
_08071BDC:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #0x72
	bne _08071BF0
	ldr r0, [r4, #0x64]
	bl Proc_End
	adds r0, r4, #0
	bl sub_8002DE4
_08071BF0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

