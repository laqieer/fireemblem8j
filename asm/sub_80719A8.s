	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056214, 0x08056214 + 1
	.set sub_8056890, 0x08056890 + 1
	.set sub_8070F64, 0x08070F64 + 1
	.set sub_8070FE8, 0x08070FE8 + 1
	.set sub_8071054, 0x08071054 + 1
	.section .text.sub_80719A8, "ax", %progbits
@ sub_80719A8 @ JP 0x080719A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80719A8
	.thumb_func
sub_80719A8:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x2c
	adds r1, r6, #0
	adds r1, #0x44
	ldr r2, [r6, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	blt _080719E0
	ldr r5, [r6, #0x4c]
	ldr r1, [r6, #0x54]
	ldr r0, [r6, #0x5c]
	lsls r4, r4, #2
	adds r1, r4, r1
	ldr r1, [r1]
	bl sub_8071054
	ldr r0, [r6, #0x5c]
	ldrh r1, [r6, #0x2e]
	adds r4, r4, r5
	ldr r2, [r4]
	movs r3, #1
	bl sub_8070FE8
	b _080719F8
_080719E0:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _080719F8
	ldr r0, [r6, #0x5c]
	bl sub_8070F64
	bl sub_8056214
	adds r0, r6, #0
	bl sub_8002DE4
_080719F8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

