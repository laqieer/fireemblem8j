	.syntax unified
	.section .text.GetBanimTerrainGround, "ax", %progbits
@ GetBanimTerrainGround @ JP 0x08058BF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetBanimTerrainGround
	.thumb_func
GetBanimTerrainGround:
	push {lr}
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0x14
	bls _08058C04
	b _08058D08
_08058C04:
	lsls r0, r0, #2
	ldr r1, _08058C10 @ =_08058C14
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08058C10: .4byte _08058C14
_08058C14: @ jump table
	.4byte _08058D08 @ case 0
	.4byte _08058C68 @ case 1
	.4byte _08058C70 @ case 2
	.4byte _08058C78 @ case 3
	.4byte _08058C80 @ case 4
	.4byte _08058C88 @ case 5
	.4byte _08058C90 @ case 6
	.4byte _08058C98 @ case 7
	.4byte _08058CA0 @ case 8
	.4byte _08058CA8 @ case 9
	.4byte _08058CB0 @ case 10
	.4byte _08058CB8 @ case 11
	.4byte _08058CC0 @ case 12
	.4byte _08058CC8 @ case 13
	.4byte _08058CD0 @ case 14
	.4byte _08058CD8 @ case 15
	.4byte _08058CE0 @ case 16
	.4byte _08058CE8 @ case 17
	.4byte _08058CF0 @ case 18
	.4byte _08058CF8 @ case 19
	.4byte _08058D00 @ case 20
_08058C68:
	ldr r0, _08058C6C @ =0x08860D5F
	b _08058D0A
	.align 2, 0
_08058C6C: .4byte 0x08860D5F
_08058C70:
	ldr r0, _08058C74 @ =0x08860DA0
	b _08058D0A
	.align 2, 0
_08058C74: .4byte 0x08860DA0
_08058C78:
	ldr r0, _08058C7C @ =0x08860DE1
	b _08058D0A
	.align 2, 0
_08058C7C: .4byte 0x08860DE1
_08058C80:
	ldr r0, _08058C84 @ =0x08860E22
	b _08058D0A
	.align 2, 0
_08058C84: .4byte 0x08860E22
_08058C88:
	ldr r0, _08058C8C @ =0x08860E63
	b _08058D0A
	.align 2, 0
_08058C8C: .4byte 0x08860E63
_08058C90:
	ldr r0, _08058C94 @ =0x08860EA4
	b _08058D0A
	.align 2, 0
_08058C94: .4byte 0x08860EA4
_08058C98:
	ldr r0, _08058C9C @ =0x08860EE5
	b _08058D0A
	.align 2, 0
_08058C9C: .4byte 0x08860EE5
_08058CA0:
	ldr r0, _08058CA4 @ =0x08860F26
	b _08058D0A
	.align 2, 0
_08058CA4: .4byte 0x08860F26
_08058CA8:
	ldr r0, _08058CAC @ =0x08860F67
	b _08058D0A
	.align 2, 0
_08058CAC: .4byte 0x08860F67
_08058CB0:
	ldr r0, _08058CB4 @ =0x08860FA8
	b _08058D0A
	.align 2, 0
_08058CB4: .4byte 0x08860FA8
_08058CB8:
	ldr r0, _08058CBC @ =0x08860FE9
	b _08058D0A
	.align 2, 0
_08058CBC: .4byte 0x08860FE9
_08058CC0:
	ldr r0, _08058CC4 @ =0x0886102A
	b _08058D0A
	.align 2, 0
_08058CC4: .4byte 0x0886102A
_08058CC8:
	ldr r0, _08058CCC @ =0x0886106B
	b _08058D0A
	.align 2, 0
_08058CCC: .4byte 0x0886106B
_08058CD0:
	ldr r0, _08058CD4 @ =0x088610AC
	b _08058D0A
	.align 2, 0
_08058CD4: .4byte 0x088610AC
_08058CD8:
	ldr r0, _08058CDC @ =0x088610ED
	b _08058D0A
	.align 2, 0
_08058CDC: .4byte 0x088610ED
_08058CE0:
	ldr r0, _08058CE4 @ =0x0886112E
	b _08058D0A
	.align 2, 0
_08058CE4: .4byte 0x0886112E
_08058CE8:
	ldr r0, _08058CEC @ =0x0886116F
	b _08058D0A
	.align 2, 0
_08058CEC: .4byte 0x0886116F
_08058CF0:
	ldr r0, _08058CF4 @ =0x088611B0
	b _08058D0A
	.align 2, 0
_08058CF4: .4byte 0x088611B0
_08058CF8:
	ldr r0, _08058CFC @ =0x088611F1
	b _08058D0A
	.align 2, 0
_08058CFC: .4byte 0x088611F1
_08058D00:
	ldr r0, _08058D04 @ =0x08861232
	b _08058D0A
	.align 2, 0
_08058D04: .4byte 0x08861232
_08058D08:
	ldr r0, _08058D18 @ =0x08860D1E
_08058D0A:
	adds r0, r2, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_08058D18: .4byte 0x08860D1E

