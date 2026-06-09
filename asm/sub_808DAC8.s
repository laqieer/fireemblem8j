	.syntax unified
	.set ScrollBoxDialogueTilesUp, 0x0808C840 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.section .text.sub_808DAC8, "ax", %progbits
@ sub_808DAC8 @ JP 0x0808DAC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808DAC8
	.thumb_func
sub_808DAC8:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x54
	ldrb r0, [r0]
	adds r0, #1
	adds r1, r4, #0
	adds r1, #0x55
	ldrb r1, [r1]
	bl ScrollBoxDialogueTilesUp
	adds r1, r4, #0
	adds r1, #0x58
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x10
	bne _0808DB08
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #3
	ldr r1, _0808DB10 @ =0x0203E7FC
	adds r0, r0, r1
	movs r1, #0
	bl sub_8003D84
	adds r0, r4, #0
	bl sub_8002DE4
_0808DB08:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808DB10: .4byte 0x0203E7FC

