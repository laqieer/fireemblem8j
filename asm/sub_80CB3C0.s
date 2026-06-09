	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.section .text.sub_80CB3C0, "ax", %progbits
@ sub_80CB3C0 @ JP 0x080CB3C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CB3C0
	.thumb_func
sub_80CB3C0:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	lsls r2, r2, #0x18
	lsrs r0, r2, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	cmp r0, #4
	bls _080CB3D6
	b _080CB62A
_080CB3D6:
	lsls r0, r0, #2
	ldr r1, _080CB3E0 @ =_080CB3E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CB3E0: .4byte _080CB3E4
_080CB3E4: @ jump table
	.4byte _080CB3F8 @ case 0
	.4byte _080CB440 @ case 1
	.4byte _080CB488 @ case 2
	.4byte _080CB4FC @ case 3
	.4byte _080CB570 @ case 4
_080CB3F8:
	cmp r3, #1
	beq _080CB41C
	cmp r3, #1
	bgt _080CB406
	cmp r3, #0
	beq _080CB410
	b _080CB62A
_080CB406:
	cmp r3, #2
	beq _080CB428
	cmp r3, #3
	beq _080CB434
	b _080CB62A
_080CB410:
	movs r5, #0xce
	ldr r4, _080CB418 @ =0x08B3F218
	b _080CB62A
	.align 2, 0
_080CB418: .4byte 0x08B3F218
_080CB41C:
	movs r5, #0xce
	ldr r4, _080CB424 @ =0x08B3F22C
	b _080CB62A
	.align 2, 0
_080CB424: .4byte 0x08B3F22C
_080CB428:
	movs r5, #0xf6
	ldr r4, _080CB430 @ =0x08B3F218
	b _080CB62A
	.align 2, 0
_080CB430: .4byte 0x08B3F218
_080CB434:
	movs r5, #0xf6
	ldr r4, _080CB43C @ =0x08B3F22C
	b _080CB62A
	.align 2, 0
_080CB43C: .4byte 0x08B3F22C
_080CB440:
	cmp r3, #1
	beq _080CB464
	cmp r3, #1
	bgt _080CB44E
	cmp r3, #0
	beq _080CB458
	b _080CB62A
_080CB44E:
	cmp r3, #2
	beq _080CB470
	cmp r3, #3
	beq _080CB47C
	b _080CB62A
_080CB458:
	movs r5, #0x8f
	lsls r5, r5, #1
	ldr r4, _080CB460 @ =0x08B3F240
	b _080CB62A
	.align 2, 0
_080CB460: .4byte 0x08B3F240
_080CB464:
	movs r5, #0x8f
	lsls r5, r5, #1
	ldr r4, _080CB46C @ =0x08B3F24E
	b _080CB62A
	.align 2, 0
_080CB46C: .4byte 0x08B3F24E
_080CB470:
	movs r5, #0x9b
	lsls r5, r5, #1
	ldr r4, _080CB478 @ =0x08B3F240
	b _080CB62A
	.align 2, 0
_080CB478: .4byte 0x08B3F240
_080CB47C:
	movs r5, #0x9b
	lsls r5, r5, #1
	ldr r4, _080CB484 @ =0x08B3F24E
	b _080CB62A
	.align 2, 0
_080CB484: .4byte 0x08B3F24E
_080CB488:
	cmp r3, #5
	bls _080CB48E
	b _080CB62A
_080CB48E:
	lsls r0, r3, #2
	ldr r1, _080CB498 @ =_080CB49C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CB498: .4byte _080CB49C
_080CB49C: @ jump table
	.4byte _080CB4B4 @ case 0
	.4byte _080CB4C0 @ case 1
	.4byte _080CB4CC @ case 2
	.4byte _080CB4D8 @ case 3
	.4byte _080CB4E4 @ case 4
	.4byte _080CB4F0 @ case 5
_080CB4B4:
	movs r5, #0xa7
	lsls r5, r5, #1
	ldr r4, _080CB4BC @ =0x08B3F25C
	b _080CB62A
	.align 2, 0
_080CB4BC: .4byte 0x08B3F25C
_080CB4C0:
	movs r5, #0xa7
	lsls r5, r5, #1
	ldr r4, _080CB4C8 @ =0x08B3F26A
	b _080CB62A
	.align 2, 0
_080CB4C8: .4byte 0x08B3F26A
_080CB4CC:
	movs r5, #0xad
	lsls r5, r5, #1
	ldr r4, _080CB4D4 @ =0x08B3F25C
	b _080CB62A
	.align 2, 0
_080CB4D4: .4byte 0x08B3F25C
_080CB4D8:
	movs r5, #0xad
	lsls r5, r5, #1
	ldr r4, _080CB4E0 @ =0x08B3F26A
	b _080CB62A
	.align 2, 0
_080CB4E0: .4byte 0x08B3F26A
_080CB4E4:
	movs r5, #0xbf
	lsls r5, r5, #1
	ldr r4, _080CB4EC @ =0x08B3F25C
	b _080CB62A
	.align 2, 0
_080CB4EC: .4byte 0x08B3F25C
_080CB4F0:
	movs r5, #0xbf
	lsls r5, r5, #1
	ldr r4, _080CB4F8 @ =0x08B3F26A
	b _080CB62A
	.align 2, 0
_080CB4F8: .4byte 0x08B3F26A
_080CB4FC:
	cmp r3, #5
	bls _080CB502
	b _080CB62A
_080CB502:
	lsls r0, r3, #2
	ldr r1, _080CB50C @ =_080CB510
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CB50C: .4byte _080CB510
_080CB510: @ jump table
	.4byte _080CB528 @ case 0
	.4byte _080CB534 @ case 1
	.4byte _080CB540 @ case 2
	.4byte _080CB54C @ case 3
	.4byte _080CB558 @ case 4
	.4byte _080CB564 @ case 5
_080CB528:
	movs r5, #0xb3
	lsls r5, r5, #1
	ldr r4, _080CB530 @ =0x08B3F278
	b _080CB62A
	.align 2, 0
_080CB530: .4byte 0x08B3F278
_080CB534:
	movs r5, #0xb3
	lsls r5, r5, #1
	ldr r4, _080CB53C @ =0x08B3F280
	b _080CB62A
	.align 2, 0
_080CB53C: .4byte 0x08B3F280
_080CB540:
	movs r5, #0xb5
	lsls r5, r5, #1
	ldr r4, _080CB548 @ =0x08B3F278
	b _080CB62A
	.align 2, 0
_080CB548: .4byte 0x08B3F278
_080CB54C:
	movs r5, #0xb5
	lsls r5, r5, #1
	ldr r4, _080CB554 @ =0x08B3F280
	b _080CB62A
	.align 2, 0
_080CB554: .4byte 0x08B3F280
_080CB558:
	movs r5, #0xb9
	lsls r5, r5, #1
	ldr r4, _080CB560 @ =0x08B3F278
	b _080CB62A
	.align 2, 0
_080CB560: .4byte 0x08B3F278
_080CB564:
	movs r5, #0xb9
	lsls r5, r5, #1
	ldr r4, _080CB56C @ =0x08B3F280
	b _080CB62A
	.align 2, 0
_080CB56C: .4byte 0x08B3F280
_080CB570:
	cmp r3, #0xb
	bhi _080CB62A
	lsls r0, r3, #2
	ldr r1, _080CB580 @ =_080CB584
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CB580: .4byte _080CB584
_080CB584: @ jump table
	.4byte _080CB5B4 @ case 0
	.4byte _080CB5C0 @ case 1
	.4byte _080CB5C6 @ case 2
	.4byte _080CB5D4 @ case 3
	.4byte _080CB5DA @ case 4
	.4byte _080CB5E8 @ case 5
	.4byte _080CB5EE @ case 6
	.4byte _080CB5FC @ case 7
	.4byte _080CB602 @ case 8
	.4byte _080CB610 @ case 9
	.4byte _080CB616 @ case 10
	.4byte _080CB624 @ case 11
_080CB5B4:
	movs r5, #0xb7
	lsls r5, r5, #1
	ldr r4, _080CB5BC @ =0x08B3F288
	b _080CB62A
	.align 2, 0
_080CB5BC: .4byte 0x08B3F288
_080CB5C0:
	movs r5, #0xb7
	lsls r5, r5, #1
	b _080CB628
_080CB5C6:
	movs r5, #0xb8
	lsls r5, r5, #1
	ldr r4, _080CB5D0 @ =0x08B3F288
	b _080CB62A
	.align 2, 0
_080CB5D0: .4byte 0x08B3F288
_080CB5D4:
	movs r5, #0xb8
	lsls r5, r5, #1
	b _080CB628
_080CB5DA:
	movs r5, #0xbb
	lsls r5, r5, #1
	ldr r4, _080CB5E4 @ =0x08B3F288
	b _080CB62A
	.align 2, 0
_080CB5E4: .4byte 0x08B3F288
_080CB5E8:
	movs r5, #0xbb
	lsls r5, r5, #1
	b _080CB628
_080CB5EE:
	movs r5, #0xbc
	lsls r5, r5, #1
	ldr r4, _080CB5F8 @ =0x08B3F288
	b _080CB62A
	.align 2, 0
_080CB5F8: .4byte 0x08B3F288
_080CB5FC:
	movs r5, #0xbc
	lsls r5, r5, #1
	b _080CB628
_080CB602:
	movs r5, #0xbd
	lsls r5, r5, #1
	ldr r4, _080CB60C @ =0x08B3F288
	b _080CB62A
	.align 2, 0
_080CB60C: .4byte 0x08B3F288
_080CB610:
	movs r5, #0xbd
	lsls r5, r5, #1
	b _080CB628
_080CB616:
	movs r5, #0xbe
	lsls r5, r5, #1
	ldr r4, _080CB620 @ =0x08B3F288
	b _080CB62A
	.align 2, 0
_080CB620: .4byte 0x08B3F288
_080CB624:
	movs r5, #0xbe
	lsls r5, r5, #1
_080CB628:
	ldr r4, _080CB64C @ =0x08B3F290
_080CB62A:
	movs r1, #0xc0
	lsls r1, r1, #6
	adds r0, r1, #0
	orrs r5, r0
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r7, #0
	adds r3, r4, #0
	bl PutSpriteExt
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CB64C: .4byte 0x08B3F290

