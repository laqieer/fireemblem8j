	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set NewEkrsubAnimeEmulator, 0x08073BBC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_806E9A0, "ax", %progbits
@ sub_806E9A0 @ JP 0x0806E9A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806E9A0
	.thumb_func
sub_806E9A0:
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _0806E9C4 @ =0x086033AC
	movs r1, #3
	bl sub_8002BCC
	adds r6, r0, #0
	str r5, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	cmp r4, #0
	bne _0806E9CC
	movs r0, #0x32
	strh r0, [r6, #0x2e]
	ldr r4, _0806E9C8 @ =0x085F23D4
	b _0806E9D2
	.align 2, 0
_0806E9C4: .4byte 0x086033AC
_0806E9C8: .4byte 0x085F23D4
_0806E9CC:
	movs r0, #0x32
	strh r0, [r6, #0x2e]
	ldr r4, _0806EA0C @ =0x085F2448
_0806E9D2:
	adds r0, r5, #0
	bl GetAnimPosition
	movs r2, #0xa2
	lsls r2, r2, #7
	cmp r0, #0
	bne _0806E9E4
	movs r2, #0xc2
	lsls r2, r2, #7
_0806E9E4:
	movs r1, #2
	ldrsh r0, [r5, r1]
	movs r3, #4
	ldrsh r1, [r5, r3]
	subs r1, #0x28
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	movs r2, #3
	str r2, [sp, #8]
	adds r2, r4, #0
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r6, #0x60]
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806EA0C: .4byte 0x085F2448

