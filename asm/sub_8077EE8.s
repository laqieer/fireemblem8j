	.syntax unified
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_8077EE8, "ax", %progbits
@ sub_8077EE8 @ JP 0x08077EE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8077EE8
	.thumb_func
sub_8077EE8:
	push {lr}
	lsls r1, r0, #1
	adds r1, r1, r0
	adds r1, #2
	ldr r0, _08077F04 @ =0x087AACC8
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r1, _08077F08 @ =0x02022968
	bl sub_80D6394
	pop {r0}
	bx r0
	.align 2, 0
_08077F04: .4byte 0x087AACC8
_08077F08: .4byte 0x02022968

