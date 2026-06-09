	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_8063458, "ax", %progbits
@ sub_8063458 @ JP 0x08063458 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8063458
	.thumb_func
sub_8063458:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08063494 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063498 @ =0x08600D98
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, _0806349C @ =0x086AB9DC
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	adds r6, r0, #0
	str r6, [r5, #0x60]
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080634A0
	ldrh r0, [r6, #2]
	subs r0, #8
	b _080634A4
	.align 2, 0
_08063494: .4byte 0x0201774C
_08063498: .4byte 0x08600D98
_0806349C: .4byte 0x086AB9DC
_080634A0:
	ldrh r0, [r6, #2]
	adds r0, #8
_080634A4:
	strh r0, [r6, #2]
	ldrh r0, [r6, #4]
	subs r0, #8
	strh r0, [r6, #4]
	ldr r0, _080634C8 @ =0x086B3D44
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _080634CC @ =0x086B3B5C
	movs r1, #0x80
	lsls r1, r1, #4
	bl sub_8056774
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080634C8: .4byte 0x086B3D44
_080634CC: .4byte 0x086B3B5C

