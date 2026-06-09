	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.section .text.sub_805D628, "ax", %progbits
@ sub_805D628 @ JP 0x0805D628 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805D628
	.thumb_func
sub_805D628:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, _0805D654 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805D658 @ =0x085FF370
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	cmp r4, #0
	bne _0805D664
	ldr r2, _0805D65C @ =0x0860696C
	ldr r3, _0805D660 @ =0x08606BC0
	b _0805D668
	.align 2, 0
_0805D654: .4byte 0x0201774C
_0805D658: .4byte 0x085FF370
_0805D65C: .4byte 0x0860696C
_0805D660: .4byte 0x08606BC0
_0805D664:
	ldr r2, _0805D688 @ =0x08606E20
	ldr r3, _0805D68C @ =0x08607080
_0805D668:
	str r2, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	bl sub_80564F0
	adds r4, r0, #0
	str r4, [r5, #0x60]
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805D690
	ldrh r0, [r4, #2]
	adds r0, #0x38
	b _0805D694
	.align 2, 0
_0805D688: .4byte 0x08606E20
_0805D68C: .4byte 0x08607080
_0805D690:
	ldrh r0, [r4, #2]
	subs r0, #0x38
_0805D694:
	strh r0, [r4, #2]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

