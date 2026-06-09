	.syntax unified
	.set sub_800226C, 0x0800226C + 1
	.section .text.sub_8087654, "ax", %progbits
@ sub_8087654 @ JP 0x08087654 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8087654
	.thumb_func
sub_8087654:
	push {lr}
	ldr r2, _08087678 @ =0x0202BCEC
	ldrb r1, [r2, #0x14]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0808766E
	adds r0, r2, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _08087674
_0808766E:
	movs r0, #4
	bl sub_800226C
_08087674:
	pop {r0}
	bx r0
	.align 2, 0
_08087678: .4byte 0x0202BCEC

