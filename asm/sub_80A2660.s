	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set sub_809DA14, 0x0809DA14 + 1
	.set sub_80A2074, 0x080A2074 + 1
	.set sub_80A224C, 0x080A224C + 1
	.set sub_80B1524, 0x080B1524 + 1
	.set sub_80B1DD8, 0x080B1DD8 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_80A2660, "ax", %progbits
@ sub_80A2660 @ JP 0x080A2660 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A2660
	.thumb_func
sub_80A2660:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080A26B4 @ =0x02022EEC
	ldr r1, _080A26B8 @ =0x02013668
	ldr r2, [r4, #0x2c]
	movs r3, #0
	bl sub_809DA14
	ldr r1, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl sub_80A224C
	movs r0, #0
	bl sub_80B1524
	ldr r0, _080A26BC @ =sub_80A2198
	bl sub_80B1DD8
	bl Proc_End
	ldrb r1, [r5]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #3
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80B1FBC
	movs r0, #0
	adds r1, r4, #0
	bl sub_80A2074
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A26B4: .4byte 0x02022EEC
_080A26B8: .4byte 0x02013668
_080A26BC: .4byte 0x080A2199  @ sub_80A2198

