	.syntax unified
	.set InitText, 0x08003C8C + 1
	.set PutText, 0x08003DA0 + 1
	.set strlen, 0x080D6A08 + 1
	.set sub_8003D98, 0x08003D98 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_8038574, "ax", %progbits
@ sub_8038574 @ JP 0x08038574 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8038574
	.thumb_func
sub_8038574:
	push {r4, r5, r6, lr}
	sub sp, #0x24
	adds r6, r0, #0
	mov r0, sp
	ldr r1, _08038590 @ =0x080DCD4C
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	mov r5, sp
	b _080385D4
	.align 2, 0
_08038590: .4byte 0x080DCD4C
_08038594:
	ldrh r0, [r5]
	bl sub_8009FA8
	adds r4, r0, #0
	bl strlen
	adds r1, r0, #0
	adds r0, r6, #0
	bl InitText
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0
	bl sub_8003D98
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_8003F28
	movs r1, #3
	ldrsb r1, [r5, r1]
	lsls r1, r1, #5
	movs r0, #2
	ldrsb r0, [r5, r0]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _080385E4 @ =0x02022CA8
	adds r1, r1, r0
	adds r0, r6, #0
	bl PutText
	adds r5, #4
_080385D4:
	ldrh r0, [r5]
	cmp r0, #0
	bne _08038594
	add sp, #0x24
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080385E4: .4byte 0x02022CA8

