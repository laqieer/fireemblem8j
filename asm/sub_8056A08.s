	.syntax unified
	.set Get0201FAC8, 0x080569CC + 1
	.set Set0201FAC8, 0x080569D8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8056A08, "ax", %progbits
@ sub_8056A08 @ JP 0x08056A08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8056A08
	.thumb_func
sub_8056A08:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r6, [r5, #0x44]
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r1, #0
	ldrsh r2, [r0, r1]
	movs r1, #2
	ldrsh r3, [r0, r1]
	ldr r1, _08056A78 @ =0x02000000
	ldr r4, [r1]
	ldrh r0, [r4, #2]
	adds r0, r2, r0
	movs r7, #0
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	adds r0, r3, r0
	strh r0, [r4, #4]
	ldr r4, [r1, #4]
	ldrh r0, [r4, #2]
	adds r0, r2, r0
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	adds r0, r3, r0
	strh r0, [r4, #4]
	ldr r4, [r1, #8]
	ldrh r0, [r4, #2]
	adds r0, r2, r0
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	adds r0, r3, r0
	strh r0, [r4, #4]
	ldr r4, [r1, #0xc]
	ldrh r0, [r4, #2]
	adds r0, r2, r0
	strh r0, [r4, #2]
	ldrh r0, [r4, #4]
	adds r0, r3, r0
	strh r0, [r4, #4]
	ldr r1, _08056A7C @ =0x03003020
	ldrh r0, [r1, #0x26]
	subs r0, r0, r2
	strh r0, [r1, #0x26]
	ldrh r0, [r1, #0x24]
	subs r0, r0, r3
	strh r0, [r1, #0x24]
	bl Get0201FAC8
	cmp r0, #0
	bne _08056A80
	adds r0, r5, #0
	bl sub_8002DE4
	b _08056AB6
	.align 2, 0
_08056A78: .4byte 0x02000000
_08056A7C: .4byte 0x03003020
_08056A80:
	bl Get0201FAC8
	cmp r0, #2
	bne _08056A9C
	ldr r0, _08056A98 @ =0x080DF55C
	str r0, [r5, #0x44]
	strh r7, [r5, #0x2c]
	movs r0, #3
	bl Set0201FAC8
	b _08056AB6
	.align 2, 0
_08056A98: .4byte 0x080DF55C
_08056A9C:
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	movs r2, #0x2c
	ldrsh r0, [r5, r2]
	lsls r0, r0, #2
	adds r0, r0, r6
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, _08056ABC @ =0x00007FFF
	cmp r1, r0
	bne _08056AB6
	strh r7, [r5, #0x2c]
_08056AB6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056ABC: .4byte 0x00007FFF

