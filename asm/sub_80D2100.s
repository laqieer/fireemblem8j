	.syntax unified
	.set SetBanimTerrainPos, 0x0805BBE4 + 1
	.set sub_805B80C, 0x0805B80C + 1
	.section .text.sub_80D2100, "ax", %progbits
@ sub_80D2100 @ JP 0x080D2100 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D2100
	.thumb_func
sub_80D2100:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r1, #0
	adds r6, r2, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r4, _080D215C @ =0x0201FADC
	movs r2, #0
	strh r0, [r4]
	movs r1, #0xe
	strh r1, [r4, #2]
	movs r1, #0xe0
	lsls r1, r1, #2
	strh r1, [r4, #4]
	strh r0, [r4, #6]
	movs r0, #0xf
	strh r0, [r4, #8]
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	strh r2, [r4, #0xc]
	ldr r0, _080D2160 @ =0x0000FFFF
	strh r0, [r4, #0xe]
	ldr r0, _080D2164 @ =0x06010000
	str r0, [r4, #0x1c]
	ldr r0, _080D2168 @ =0x020145C8
	str r0, [r4, #0x20]
	adds r0, r4, #0
	bl sub_805B80C
	adds r3, r5, #0
	adds r3, #0x60
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	str r6, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl SetBanimTerrainPos
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D215C: .4byte 0x0201FADC
_080D2160: .4byte 0x0000FFFF
_080D2164: .4byte 0x06010000
_080D2168: .4byte 0x020145C8

