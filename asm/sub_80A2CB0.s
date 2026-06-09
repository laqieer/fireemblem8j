	.syntax unified
	.set GetROMChapterStruct, 0x08034520 + 1
	.section .text.sub_80A2CB0, "ax", %progbits
@ sub_80A2CB0 @ JP 0x080A2CB0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A2CB0
	.thumb_func
sub_80A2CB0:
	push {lr}
	ldr r0, _080A2CC8 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	adds r0, #0x7e
	ldrb r0, [r0]
	pop {r1}
	bx r1
	.align 2, 0
_080A2CC8: .4byte 0x0202BCEC

