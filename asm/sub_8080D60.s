	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8080D60, "ax", %progbits
@ sub_8080D60 @ JP 0x08080D60 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8080D60
	.thumb_func
sub_8080D60:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	ldr r0, _08080D8C @ =0x08A1454C
	bl sub_8002BCC
	adds r2, r0, #0
	str r4, [r2, #0x58]
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	adds r0, #2
	strh r5, [r0]
	adds r0, #2
	strh r1, [r0]
	adds r0, #2
	strh r6, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08080D8C: .4byte 0x08A1454C

