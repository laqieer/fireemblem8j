	.syntax unified
	.set BG_EnableSync, 0x08001F0C + 1
	.section .text.sub_8003750, "ax", %progbits
@ sub_8003750 @ JP 0x08003750 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003750
	.thumb_func
sub_8003750:
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldrb r0, [r1]
	ldr r5, _0800376C @ =0x02026E30
	cmp r0, #0
	beq _08003788
	adds r3, r5, #0
	ldr r4, _08003770 @ =0x0000FFC0
_08003760:
	cmp r0, #0x60
	bls _08003774
	ldrh r0, [r3, #6]
	adds r0, r0, r4
	b _08003778
	.align 2, 0
_0800376C: .4byte 0x02026E30
_08003770: .4byte 0x0000FFC0
_08003774:
	ldrh r0, [r3, #6]
	subs r0, #0x20
_08003778:
	ldrb r6, [r1]
	adds r0, r0, r6
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	ldrb r0, [r1]
	cmp r0, #0
	bne _08003760
_08003788:
	movs r1, #4
	ldrsh r0, [r5, r1]
	bl BG_EnableSync
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

