	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_805E544, "ax", %progbits
@ sub_805E544 @ JP 0x0805E544 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805E544
	.thumb_func
sub_805E544:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _0805E580 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E584 @ =0x085FF608
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r2, _0805E588 @ =0x08610DE4
	ldr r3, _0805E58C @ =0x08611A14
	str r2, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	bl sub_80564F0
	adds r6, r0, #0
	str r6, [r5, #0x60]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0805E590
	ldrh r0, [r6, #2]
	adds r0, #0x20
	b _0805E594
	.align 2, 0
_0805E580: .4byte 0x0201774C
_0805E584: .4byte 0x085FF608
_0805E588: .4byte 0x08610DE4
_0805E58C: .4byte 0x08611A14
_0805E590:
	ldrh r0, [r6, #2]
	subs r0, #0x20
_0805E594:
	strh r0, [r6, #2]
	ldr r0, _0805E5B0 @ =0x0860C600
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _0805E5B4 @ =0x0860A83C
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805E5B0: .4byte 0x0860C600
_0805E5B4: .4byte 0x0860A83C

