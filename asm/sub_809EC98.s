	.syntax unified
	.set sub_809EBFC, 0x0809EBFC + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_809EC98, "ax", %progbits
@ sub_809EC98 @ JP 0x0809EC98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809EC98
	.thumb_func
sub_809EC98:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_809EBFC
	ldr r0, [r4, #0x3c]
	lsls r0, r0, #5
	adds r0, #0x94
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x78
	movs r2, #0
	bl sub_80B1FBC
	pop {r4}
	pop {r0}
	bx r0

