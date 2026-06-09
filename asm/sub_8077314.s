	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80770B0, 0x080770B0 + 1
	.section .text.sub_8077314, "ax", %progbits
@ sub_8077314 @ JP 0x08077314 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8077314
	.thumb_func
sub_8077314:
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x50]
	cmp r2, #0
	bge _08077324
	bl sub_8002DE4
	b _08077346
_08077324:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xf
	bne _08077346
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	bl sub_80770B0
	adds r0, r4, #0
	bl sub_8002DE4
_08077346:
	pop {r4}
	pop {r0}
	bx r0

