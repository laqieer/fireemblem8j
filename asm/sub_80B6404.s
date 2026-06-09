	.syntax unified
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80B6404, "ax", %progbits
@ sub_80B6404 @ JP 0x080B6404 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B6404
	.thumb_func
sub_80B6404:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #8
	adds r5, r0, #0
	adds r4, r1, #0
	adds r6, r2, #0
	ldr r0, _080B6460 @ =0x08AAF6D8
	mov r8, r0
	lsls r4, r4, #3
	adds r4, #0x38
	ldr r0, [r0]
	adds r0, r0, r4
	bl sub_8003CF8
	ldr r2, _080B6464 @ =0x08AAF700
	ldr r0, _080B6468 @ =0x08AAF6DC
	adds r5, r5, r0
	ldrb r1, [r5]
	movs r0, #0x2c
	muls r0, r1, r0
	adds r0, r0, r2
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r2, r0, #0
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r4
	lsls r6, r6, #6
	ldr r1, _080B646C @ =0x020234B0
	adds r6, r6, r1
	movs r1, #9
	str r1, [sp]
	str r2, [sp, #4]
	adds r1, r6, #0
	movs r2, #0
	movs r3, #0
	bl sub_8004374
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B6460: .4byte 0x08AAF6D8
_080B6464: .4byte 0x08AAF700
_080B6468: .4byte 0x08AAF6DC
_080B646C: .4byte 0x020234B0

