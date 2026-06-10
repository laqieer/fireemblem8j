	.syntax unified
	.set sub_8013048, 0x08013048 + 1
	.set sub_80D636C, 0x080D636C + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_8012FD8, "ax", %progbits
@ sub_8012FD8 @ JP 0x08012FD8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8012FD8
	.thumb_func
sub_8012FD8:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r6, _08013004 @ =0x02020188
	adds r1, r6, #0
	bl sub_80D6394
	adds r0, r4, #0
	bl sub_8013048
	cmp r0, #0
	bge _08012FF2
	adds r0, #3
_08012FF2:
	lsls r2, r0, #9
	lsrs r2, r2, #0xb
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_80D636C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08013004: .4byte 0x02020188

