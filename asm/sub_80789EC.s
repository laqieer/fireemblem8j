	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8078D30, 0x08078D30 + 1
	.section .text.sub_80789EC, "ax", %progbits
@ sub_80789EC @ JP 0x080789EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80789EC
	.thumb_func
sub_80789EC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl sub_8078D30
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

