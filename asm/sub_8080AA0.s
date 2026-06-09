	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8080AA0, "ax", %progbits
@ sub_8080AA0 @ JP 0x08080AA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8080AA0
	.thumb_func
sub_8080AA0:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08080AD4 @ =0x08A144F4
	movs r1, #3
	bl sub_8002BCC
	ldr r2, _08080AD8 @ =0x0202BCAC
	ldrh r1, [r2, #0xc]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r4, r4, r1
	lsls r4, r4, #4
	adds r4, #8
	str r4, [r0, #0x30]
	ldrh r1, [r2, #0xe]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	subs r5, r5, r1
	lsls r5, r5, #4
	adds r5, #8
	str r5, [r0, #0x34]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080AD4: .4byte 0x08A144F4
_08080AD8: .4byte 0x0202BCAC

