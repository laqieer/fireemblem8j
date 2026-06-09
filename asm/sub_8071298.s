	.syntax unified
	.set AnimDelete, 0x08004F0C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8071298, "ax", %progbits
@ sub_8071298 @ JP 0x08071298 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071298
	.thumb_func
sub_8071298:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x32
	ble _080712B6
	ldr r0, [r4, #0x60]
	bl AnimDelete
	adds r0, r4, #0
	bl sub_8002DE4
_080712B6:
	pop {r4}
	pop {r0}
	bx r0

