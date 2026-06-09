	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_808A144, "ax", %progbits
@ sub_808A144 @ JP 0x0808A144 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808A144
	.thumb_func
sub_808A144:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r4, _0808A1B8 @ =0x02003BFC
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, #0x6f
	movs r0, #6
	ldrsh r2, [r4, r0]
	adds r2, #1
	ldr r3, _0808A1BC @ =0x08A729B6
	ldr r0, _0808A1C0 @ =0x00004E93
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	movs r0, #4
	ldrsh r1, [r4, r0]
	adds r1, #0x72
	movs r0, #6
	ldrsh r2, [r4, r0]
	ldr r3, _0808A1C4 @ =0x08A729DC
	lsls r0, r5, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r4, _0808A1C8 @ =0x08A729E8
	lsls r0, r5, #1
	adds r0, r0, r4
	ldrh r0, [r0]
	movs r4, #0xf9
	lsls r4, r4, #6
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSprite
	bl sub_8000CD8
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r5, r5, #5
	lsls r0, r0, #1
	ldr r1, _0808A1CC @ =0x08A748B4
	adds r0, r0, r1
	adds r5, r5, r0
	ldr r1, _0808A1D0 @ =0x02022B24
	adds r0, r5, #0
	movs r2, #1
	bl sub_80D6370
	bl sub_8001EE4
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808A1B8: .4byte 0x02003BFC
_0808A1BC: .4byte 0x08A729B6
_0808A1C0: .4byte 0x00004E93
_0808A1C4: .4byte 0x08A729DC
_0808A1C8: .4byte 0x08A729E8
_0808A1CC: .4byte 0x08A748B4
_0808A1D0: .4byte 0x02022B24

