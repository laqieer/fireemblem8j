	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set __modsi3, 0x080D6690 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8089BAC, 0x08089BAC + 1
	.set sub_8089D64, 0x08089D64 + 1
	.set sub_808A108, 0x0808A108 + 1
	.set sub_808AC2C, 0x0808AC2C + 1
	.section .text.sub_808A9C8, "ax", %progbits
@ sub_808A9C8 @ JP 0x0808A9C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808A9C8
	.thumb_func
sub_808A9C8:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r2, _0808AA40 @ =0x085775CC
	ldr r3, [r2]
	ldrh r1, [r3, #8]
	movs r0, #2
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0
	beq _0808AA50
	ldr r2, _0808AA44 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	bl SetBlendBackdropA
	ldr r0, _0808AA48 @ =0x020228A8
	strh r4, [r0]
	bl sub_8001EE4
	adds r0, r5, #0
	bl sub_8002DE4
	ldr r0, _0808AA4C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0808AA38
	b _0808AB34
_0808AA38:
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0808AB34
	.align 2, 0
_0808AA40: .4byte 0x085775CC
_0808AA44: .4byte 0x03003020
_0808AA48: .4byte 0x020228A8
_0808AA4C: .4byte 0x0202BCEC
_0808AA50:
	ldrh r2, [r3, #6]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _0808AA74
	ldr r4, _0808AA70 @ =0x02003BFC
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	adds r0, r0, r1
	subs r0, #1
	bl __modsi3
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0x20
	b _0808AA92
	.align 2, 0
_0808AA70: .4byte 0x02003BFC
_0808AA74:
	movs r6, #0x10
	adds r0, r6, #0
	ands r0, r2
	cmp r0, #0
	beq _0808AAA0
	ldr r4, _0808AA9C @ =0x02003BFC
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	adds r0, r0, r1
	adds r0, #1
	bl __modsi3
	strb r0, [r4]
	ldrb r1, [r4]
	movs r0, #0x10
_0808AA92:
	adds r2, r5, #0
	bl sub_8089D64
	b _0808AB34
	.align 2, 0
_0808AA9C: .4byte 0x02003BFC
_0808AAA0:
	movs r0, #0x40
	ands r0, r2
	cmp r0, #0
	beq _0808AAC0
	ldr r0, _0808AABC @ =0x02003BFC
	ldr r0, [r0, #0xc]
	movs r4, #1
	rsbs r4, r4, #0
	adds r1, r4, #0
	bl sub_8089BAC
	adds r2, r0, #0
	adds r1, r4, #0
	b _0808AB06
	.align 2, 0
_0808AABC: .4byte 0x02003BFC
_0808AAC0:
	movs r0, #0x80
	ands r0, r2
	cmp r0, #0
	beq _0808AADC
	ldr r0, _0808AAD8 @ =0x02003BFC
	ldr r0, [r0, #0xc]
	movs r1, #1
	bl sub_8089BAC
	adds r2, r0, #0
	movs r1, #1
	b _0808AB06
	.align 2, 0
_0808AAD8: .4byte 0x02003BFC
_0808AADC:
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0808AB14
	ldr r4, _0808AB10 @ =0x02003BFC
	ldr r1, [r4, #0xc]
	ldrb r0, [r1, #0x1b]
	cmp r0, #0
	beq _0808AB14
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r4, #0xc]
	ldr r0, [r0, #0xc]
	ands r0, r6
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	beq _0808AB04
	movs r1, #1
_0808AB04:
	adds r0, r2, #0
_0808AB06:
	adds r2, r5, #0
	bl sub_808A108
	b _0808AB34
	.align 2, 0
_0808AB10: .4byte 0x02003BFC
_0808AB14:
	ldr r0, [r7]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0808AB34
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	ldr r0, _0808AB3C @ =0x02003BFC
	ldrb r0, [r0]
	adds r1, r5, #0
	bl sub_808AC2C
_0808AB34:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808AB3C: .4byte 0x02003BFC

