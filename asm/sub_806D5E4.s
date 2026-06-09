	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_806D5E4, "ax", %progbits
@ sub_806D5E4 @ JP 0x0806D5E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806D5E4
	.thumb_func
sub_806D5E4:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _0806D628 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806D62C @ =0x08603124
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0xbc
	strh r0, [r4, #0x2e]
	ldr r3, _0806D630 @ =0x087074F8
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	adds r5, r0, #0
	str r5, [r4, #0x60]
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0806D634
	movs r0, #0xc8
	b _0806D636
	.align 2, 0
_0806D628: .4byte 0x0201774C
_0806D62C: .4byte 0x08603124
_0806D630: .4byte 0x087074F8
_0806D634:
	movs r0, #0x28
_0806D636:
	strh r0, [r5, #2]
	movs r0, #0x20
	strh r0, [r5, #4]
	ldr r0, _0806D658 @ =0x08706F14
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _0806D65C @ =0x08706818
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806D658: .4byte 0x08706F14
_0806D65C: .4byte 0x08706818

