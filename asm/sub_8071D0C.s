	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056214, 0x08056214 + 1
	.set sub_8056890, 0x08056890 + 1
	.set sub_8070F64, 0x08070F64 + 1
	.set sub_8070FE8, 0x08070FE8 + 1
	.set sub_8071054, 0x08071054 + 1
	.set sub_8071084, 0x08071084 + 1
	.section .text.sub_8071D0C, "ax", %progbits
@ sub_8071D0C @ JP 0x08071D0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071D0C
	.thumb_func
sub_8071D0C:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r0, #0x2c
	adds r1, r7, #0
	adds r1, #0x44
	ldr r2, [r7, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _08071D50
	ldr r1, [r7, #0x4c]
	ldr r5, [r7, #0x54]
	ldr r6, [r7, #0x58]
	ldr r0, [r7, #0x5c]
	lsls r4, r4, #2
	adds r1, r4, r1
	ldr r2, [r1]
	movs r1, #1
	movs r3, #1
	bl sub_8070FE8
	ldr r0, [r7, #0x5c]
	adds r5, r4, r5
	ldr r1, [r5]
	bl sub_8071054
	ldr r0, [r7, #0x5c]
	adds r4, r4, r6
	ldr r1, [r4]
	bl sub_8071084
	b _08071D68
_08071D50:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _08071D68
	ldr r0, [r7, #0x5c]
	bl sub_8070F64
	bl sub_8056214
	adds r0, r7, #0
	bl sub_8002DE4
_08071D68:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

