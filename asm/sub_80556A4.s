	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_807290C, 0x0807290C + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80556A4, "ax", %progbits
@ sub_80556A4 @ JP 0x080556A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80556A4
	.thumb_func
sub_80556A4:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080556D0
	ldr r0, _080556C8 @ =0x02000054
	ldr r0, [r0]
	ldr r1, _080556CC @ =0x02022B88
	movs r2, #8
	bl sub_80D636C
	ldr r0, [r4, #0x5c]
	bl sub_807290C
	b _080556E2
	.align 2, 0
_080556C8: .4byte 0x02000054
_080556CC: .4byte 0x02022B88
_080556D0:
	ldr r0, _080556FC @ =0x02000054
	ldr r0, [r0, #4]
	ldr r1, _08055700 @ =0x02022BC8
	movs r2, #8
	bl sub_80D636C
	ldr r0, [r4, #0x5c]
	bl sub_807290C
_080556E2:
	bl sub_8001EE4
	adds r0, r4, #0
	bl sub_8002DE4
	ldr r2, [r4, #0x5c]
	ldrh r1, [r2, #0x10]
	movs r0, #0x40
	orrs r0, r1
	strh r0, [r2, #0x10]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080556FC: .4byte 0x02000054
_08055700: .4byte 0x02022BC8

