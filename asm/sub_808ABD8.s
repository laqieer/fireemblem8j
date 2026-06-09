	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80A91D0, 0x080A91D0 + 1
	.section .text.sub_808ABD8, "ax", %progbits
@ sub_808ABD8 @ JP 0x0808ABD8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808ABD8
	.thumb_func
sub_808ABD8:
	push {r4, r5, r6, r7, lr}
	adds r7, r1, #0
	ldr r2, _0808AC20 @ =0x02003BFC
	movs r6, #0
	movs r3, #0
	strh r3, [r2, #4]
	strh r3, [r2, #6]
	ldr r5, _0808AC24 @ =0x0202BCEC
	ldrb r4, [r5, #0x14]
	movs r1, #3
	ands r1, r4
	strb r1, [r2]
	str r0, [r2, #0xc]
	str r3, [r2, #0x14]
	strh r3, [r2, #2]
	strb r6, [r2, #8]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_80A91D0
	adds r5, #0x41
	ldrb r0, [r5]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0808AC10
	movs r0, #0x6a
	bl m4aSongNumStart
_0808AC10:
	ldr r0, _0808AC28 @ =0x08A72A90
	adds r1, r7, #0
	bl Proc_StartBlocking
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808AC20: .4byte 0x02003BFC
_0808AC24: .4byte 0x0202BCEC
_0808AC28: .4byte 0x08A72A90

