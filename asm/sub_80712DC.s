	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8071304, 0x08071304 + 1
	.set sub_80713E4, 0x080713E4 + 1
	.set sub_8071458, 0x08071458 + 1
	.section .text.sub_80712DC, "ax", %progbits
@ sub_80712DC @ JP 0x080712DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80712DC
	.thumb_func
sub_80712DC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_8071304
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_80713E4
	ldr r0, [r4, #0x5c]
	adds r1, r4, #0
	bl sub_8071458
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0

