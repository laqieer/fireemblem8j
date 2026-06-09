	.syntax unified
	.set sub_80A6FF0, 0x080A6FF0 + 1
	.section .text.sub_80A7024, "ax", %progbits
@ sub_80A7024 @ JP 0x080A7024 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A7024
	.thumb_func
sub_80A7024:
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	adds r6, r1, #0
	movs r5, #0
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _080A7050
	adds r4, r2, #0
_080A7036:
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_80A6FF0
	ldr r1, _080A7058 @ =0x02014F28
	adds r1, r5, r1
	strb r0, [r1]
	adds r4, #2
	adds r5, #1
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080A7036
_080A7050:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A7058: .4byte 0x02014F28

