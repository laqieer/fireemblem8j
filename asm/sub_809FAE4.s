	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set UpdateMenuScrollBarConfig, 0x080999B0 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.sub_809FAE4, "ax", %progbits
@ sub_809FAE4 @ JP 0x0809FAE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809FAE4
	.thumb_func
sub_809FAE4:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x35
	ldrb r0, [r7]
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r4, #0x7c
	bl sub_8000CD8
	ldr r2, _0809FB5C @ =0x020228A8
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	ldr r1, _0809FB60 @ =0x08A987F8
	adds r0, r0, r1
	ldrh r0, [r0]
	ldr r1, _0809FB64 @ =0x0000029A
	adds r2, r2, r1
	strh r0, [r2]
	bl sub_8001EE4
	ldr r1, _0809FB68 @ =0x08A9534C
	ldrb r0, [r7]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r5, #0x85
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldr r3, _0809FB6C @ =0x08A9533C
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x18
	bl PutSprite
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r6, #0x4c
	adds r6, r6, r0
	ldrh r1, [r6]
	ldr r0, _0809FB70 @ =0x02012F56
	ldrh r2, [r0]
	movs r0, #0xc
	movs r3, #7
	bl UpdateMenuScrollBarConfig
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809FB5C: .4byte 0x020228A8
_0809FB60: .4byte 0x08A987F8
_0809FB64: .4byte 0x0000029A
_0809FB68: .4byte 0x08A9534C
_0809FB6C: .4byte 0x08A9533C
_0809FB70: .4byte 0x02012F56

