	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C513C, 0x080C513C + 1
	.section .text.sub_80C52B0, "ax", %progbits
@ sub_80C52B0 @ JP 0x080C52B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C52B0
	.thumb_func
sub_80C52B0:
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x2a]
	adds r0, #1
	strh r0, [r2, #0x2a]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r3, #0x2c
	ldrsh r1, [r2, r3]
	cmp r0, r1
	bge _080C52CE
	adds r0, r2, #0
	bl sub_80C513C
	b _080C52D4
_080C52CE:
	adds r0, r2, #0
	bl sub_8002DE4
_080C52D4:
	pop {r0}
	bx r0

