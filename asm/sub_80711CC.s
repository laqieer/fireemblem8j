	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056214, 0x08056214 + 1
	.set sub_8056890, 0x08056890 + 1
	.set sub_8070F64, 0x08070F64 + 1
	.set sub_8070FE8, 0x08070FE8 + 1
	.section .text.sub_80711CC, "ax", %progbits
@ sub_80711CC @ JP 0x080711CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80711CC
	.thumb_func
sub_80711CC:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _080711F8
	ldr r2, [r4, #0x4c]
	ldr r0, [r4, #0x5c]
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #1
	movs r3, #1
	bl sub_8070FE8
	b _08071210
_080711F8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08071210
	ldr r0, [r4, #0x5c]
	bl sub_8070F64
	bl sub_8056214
	adds r0, r4, #0
	bl sub_8002DE4
_08071210:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

