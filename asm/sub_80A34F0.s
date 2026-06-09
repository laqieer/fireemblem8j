	.syntax unified
	.set PutSpecialChar, 0x08004A14 + 1
	.section .text.sub_80A34F0, "ax", %progbits
@ sub_80A34F0 @ JP 0x080A34F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A34F0
	.thumb_func
sub_80A34F0:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r2, #0
	adds r6, r3, #0
	ldr r2, [sp, #0x14]
	cmp r2, #0
	ble _080A351C
	lsls r0, r1, #5
	adds r0, r4, r0
	ldr r1, _080A3524 @ =0x02023CA8
	adds r5, r2, #0
	lsls r0, r0, #1
	adds r4, r0, r1
_080A350A:
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl PutSpecialChar
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _080A350A
_080A351C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3524: .4byte 0x02023CA8

