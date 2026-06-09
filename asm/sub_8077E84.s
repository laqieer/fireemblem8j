	.syntax unified
	.set sub_80D6390, 0x080D6390 + 1
	.section .text.sub_8077E84, "ax", %progbits
@ sub_8077E84 @ JP 0x08077E84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8077E84
	.thumb_func
sub_8077E84:
	push {lr}
	lsls r1, r0, #1
	adds r1, r1, r0
	ldr r0, _08077E9C @ =0x087AACC8
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _08077EA0 @ =0x06008000
	bl sub_80D6390
	pop {r0}
	bx r0
	.align 2, 0
_08077E9C: .4byte 0x087AACC8
_08077EA0: .4byte 0x06008000

