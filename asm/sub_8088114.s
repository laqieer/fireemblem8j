	.syntax unified
	.set StartBgm, 0x08002424 + 1
	.section .text.sub_8088114, "ax", %progbits
@ sub_8088114 @ JP 0x08088114 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8088114
	.thumb_func
sub_8088114:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0808812C
	movs r0, #0x3d
	movs r1, #0
	bl StartBgm
	b _08088134
_0808812C:
	movs r0, #0x3c
	movs r1, #0
	bl StartBgm
_08088134:
	ldr r2, _0808815C @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	adds r1, r4, #0
	adds r1, #0x4c
	movs r0, #0
	strh r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808815C: .4byte 0x03003020

