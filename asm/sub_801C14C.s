	.syntax unified
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.section .text.sub_801C14C, "ax", %progbits
@ sub_801C14C @ JP 0x0801C14C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801C14C
	.thumb_func
sub_801C14C:
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r5, r1, #0
	mov r1, sp
	ldr r0, _0801C174 @ =0x080DC724
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0801C17C
	ldr r0, _0801C178 @ =0x0202BCEC
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	b _0801C184
	.align 2, 0
_0801C174: .4byte 0x080DC724
_0801C178: .4byte 0x0202BCEC
_0801C17C:
	ldr r0, _0801C1E0 @ =0x0202BCEC
	adds r0, #0x42
	ldrh r0, [r0]
	lsls r0, r0, #0x17
_0801C184:
	lsrs r6, r0, #0x1e
	adds r4, r5, #0
	adds r4, #0x34
	adds r0, r4, #0
	bl sub_8003CF8
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r3, _0801C1E4 @ =0x080DC738
	cmp r0, #0
	beq _0801C1A2
	ldr r3, _0801C1E8 @ =0x080DC730
_0801C1A2:
	adds r0, r4, #0
	movs r1, #8
	movs r2, #0
	bl sub_80043B8
	lsls r0, r6, #2
	add r0, sp
	ldr r3, [r0]
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #2
	bl sub_80043B8
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	lsls r1, r1, #5
	movs r2, #0x2a
	ldrsh r0, [r5, r2]
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _0801C1EC @ =0x02022CA8
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801C1E0: .4byte 0x0202BCEC
_0801C1E4: .4byte 0x080DC738
_0801C1E8: .4byte 0x080DC730
_0801C1EC: .4byte 0x02022CA8

