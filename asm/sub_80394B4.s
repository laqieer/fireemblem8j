	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8038FF0, 0x08038FF0 + 1
	.section .text.sub_80394B4, "ax", %progbits
@ sub_80394B4 @ JP 0x080394B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80394B4
	.thumb_func
sub_80394B4:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080394F0 @ =0x02003B48
	bl sub_8038FF0
	ldr r1, _080394F4 @ =0x02003BE8
	movs r2, #0
	movs r0, #2
	strh r0, [r1]
	movs r0, #5
	strh r0, [r1, #2]
	ldr r0, _080394F8 @ =0x085C6D54
	str r0, [r1, #4]
	ldr r0, _080394FC @ =0x085C6D60
	str r0, [r1, #8]
	str r2, [r1, #0xc]
	str r2, [r1, #0x10]
	str r2, [r4, #0x38]
	ldr r0, _08039500 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080394EA
	movs r0, #0x80
	bl m4aSongNumStart
_080394EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080394F0: .4byte 0x02003B48
_080394F4: .4byte 0x02003BE8
_080394F8: .4byte 0x085C6D54
_080394FC: .4byte 0x085C6D60
_08039500: .4byte 0x0202BCEC

