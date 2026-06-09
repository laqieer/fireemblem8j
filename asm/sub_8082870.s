	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_8001570, 0x08001570 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_8082870, "ax", %progbits
@ sub_8082870 @ JP 0x08082870 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8082870
	.thumb_func
sub_8082870:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	mov r8, r1
	ldr r6, _080828D8 @ =0x08A14B2C
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r0, r4, r6
	ldr r0, [r0]
	ldr r2, _080828DC @ =0x081F528C
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r5, [r1]
	lsls r1, r5, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl sub_8013008
	adds r6, #8
	adds r4, r4, r6
	ldr r0, [r4]
	ldr r4, _080828E0 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _080828E4 @ =0x02023CA8
	ldr r1, _080828E8 @ =0x081F5294
	add r8, r1
	mov r3, r8
	ldrb r1, [r3]
	lsls r1, r1, #0xc
	orrs r5, r1
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	str r5, [sp]
	adds r1, r4, #0
	movs r2, #0
	movs r3, #0
	bl sub_8001570
	movs r0, #4
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080828D8: .4byte 0x08A14B2C
_080828DC: .4byte 0x081F528C
_080828E0: .4byte 0x02020188
_080828E4: .4byte 0x02023CA8
_080828E8: .4byte 0x081F5294

